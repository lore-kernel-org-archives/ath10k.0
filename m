Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtRiX-0004B9-81
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 01:48:30 +0000
Received: by mail-wi0-f177.google.com with SMTP id l15so3399437wiw.4
 for <ath10k@lists.infradead.org>; Tue, 25 Nov 2014 17:48:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54752F3E.6000704@candelatech.com>
References: <547525D4.5080701@candelatech.com>
 <CAEFj9850cLVSVH=BmDNwZwEpgymRhLS2yeVGgn5gUMxkj3Wunw@mail.gmail.com>
 <54752F3E.6000704@candelatech.com>
Date: Wed, 26 Nov 2014 09:48:07 +0800
Message-ID: <CAEFj984VgP2u2ehBzmY6U=utRmKOAjxF_-bY+FPxgwxma5hu_g@mail.gmail.com>
Subject: Re: IBSS mode is now supported by CT firmware.
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Is this the only patch we need to enable IBSS mode?
http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-3.17.dev.y/.git;a=commit;h=af9dabe5f23e2ad8f8603a5156ebe9227340e9e3

Please advice. Thanks

----
ChunYeow

On Wed, Nov 26, 2014 at 9:39 AM, Ben Greear <greearb@candelatech.com> wrote:
> On 11/25/2014 05:21 PM, Yeoh Chun-Yeow wrote:
>> On Wed, Nov 26, 2014 at 8:59 AM, Ben Greear <greearb@candelatech.com> wrote:
>>> A company that wishes to remain anonymous is sponsoring my
>>> effort to add IBSS (ADHOC) support to my 10.1.467 CT firmware.
>>>
>>
>> Great!
>>
>>> The kernel driver must be patched to enable IBSS mode when
>>> CT firmware is detected.
>>>
>>
>> Where can I find the patches?
>
> My 3.17 kernel:
>
> git clone git://dmz2.candelatech.com/linux-3.17.dev.y
>
> or, browse gitweb:
>
> http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-3.17.dev.y/.git;a=summary
>
>
> I'll also backport to my 3.14 tree when I get a chance,
> but it is not done yet.
>
> Probably not worth trying to post for upstream inclusion
> since it needs the CT feature flag...
>
> Thanks,
> Ben
>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
