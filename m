Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtRZs-0004Sp-CZ
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 01:39:33 +0000
Message-ID: <54752F3E.6000704@candelatech.com>
Date: Tue, 25 Nov 2014 17:39:10 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: IBSS mode is now supported by CT firmware.
References: <547525D4.5080701@candelatech.com>
 <CAEFj9850cLVSVH=BmDNwZwEpgymRhLS2yeVGgn5gUMxkj3Wunw@mail.gmail.com>
In-Reply-To: <CAEFj9850cLVSVH=BmDNwZwEpgymRhLS2yeVGgn5gUMxkj3Wunw@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 11/25/2014 05:21 PM, Yeoh Chun-Yeow wrote:
> On Wed, Nov 26, 2014 at 8:59 AM, Ben Greear <greearb@candelatech.com> wrote:
>> A company that wishes to remain anonymous is sponsoring my
>> effort to add IBSS (ADHOC) support to my 10.1.467 CT firmware.
>>
> 
> Great!
> 
>> The kernel driver must be patched to enable IBSS mode when
>> CT firmware is detected.
>>
> 
> Where can I find the patches?

My 3.17 kernel:

git clone git://dmz2.candelatech.com/linux-3.17.dev.y

or, browse gitweb:

http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-3.17.dev.y/.git;a=summary


I'll also backport to my 3.14 tree when I get a chance,
but it is not done yet.

Probably not worth trying to post for upstream inclusion
since it needs the CT feature flag...

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
