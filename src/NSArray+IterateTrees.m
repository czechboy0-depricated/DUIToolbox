//
//  NSArray+IterateTrees.m
//  DUIToolbox
//
//  Created by Honza Dvorsky on 8/22/13.
//
//The MIT License (MIT)
//
//Copyright (c) 2013 Honza Dvorsky
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of
//this software and associated documentation files (the "Software"), to deal in
//the Software without restriction, including without limitation the rights to
//use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//the Software, and to permit persons to whom the Software is furnished to do so,
//subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "NSArray+IterateTrees.h"

@implementation NSArray (IterateTrees)

//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
+ (void) depthFirstIterateRoot1:(id)root1
                       andRoot2:(id)root2
                 expandingBlock:(IterateTwoTreesExpandBlock)expandBlock
                  functionBlock:(IterateTwoTreesFunctionBlock)functionBlock
//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
{
    assert([root1 isMemberOfClass:[root2 class]]);
    assert(functionBlock && expandBlock);
    
    //call the function block
    functionBlock(root1, root2);
    
    //get the subtrees and iterate those too
    NSArray * subtree1 = expandBlock(root1);
    NSArray * subtree2 = expandBlock(root2);
    
    assert([subtree1 count] == [subtree2 count]);
    
    NSInteger size = [subtree1 count];
    
    for (NSInteger i = 0; i < size; i++) {
        [self depthFirstIterateRoot1:subtree1[i]
                            andRoot2:subtree2[i]
                      expandingBlock:expandBlock
                       functionBlock:functionBlock];
    }
}

//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
+ (void) depthFirstIterateRoot1:(id)root1
                       andRoot2:(id)root2
                       andRoot3:(id)root3
                 expandingBlock:(IterateThreeTreesExpandBlock)expandBlock
                  functionBlock:(IterateThreeTreesFunctionBlock)functionBlock
//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
{
    assert([root1 isMemberOfClass:[root2 class]]
           &&[root1 isMemberOfClass:[root3 class]]);
    assert(functionBlock && expandBlock);
    
    //call the function block
    functionBlock(root1, root2, root3);
    
    //get the subtrees and iterate those too
    NSArray * subtree1 = expandBlock(root1);
    NSArray * subtree2 = expandBlock(root2);
    NSArray * subtree3 = expandBlock(root3);
    
    assert([subtree1 count] == [subtree2 count] && [subtree1 count] == [subtree3 count]);
    
    NSInteger size = [subtree1 count];
    
    for (NSInteger i = 0; i < size; i++) {
        [self depthFirstIterateRoot1:subtree1[i]
                            andRoot2:subtree2[i]
                            andRoot3:subtree3[i]
                      expandingBlock:expandBlock
                       functionBlock:functionBlock];
    }
}

@end