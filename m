Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtS8S-00027Y-Sc
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 02:15:17 +0000
Received: by mail-wg0-f53.google.com with SMTP id l18so2415387wgh.26
 for <ath10k@lists.infradead.org>; Tue, 25 Nov 2014 18:14:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <547531E0.6040707@candelatech.com>
References: <547525D4.5080701@candelatech.com>
 <CAEFj9850cLVSVH=BmDNwZwEpgymRhLS2yeVGgn5gUMxkj3Wunw@mail.gmail.com>
 <54752F3E.6000704@candelatech.com>
 <CAEFj984VgP2u2ehBzmY6U=utRmKOAjxF_-bY+FPxgwxma5hu_g@mail.gmail.com>
 <547531E0.6040707@candelatech.com>
Date: Wed, 26 Nov 2014 10:14:52 +0800
Message-ID: <CAEFj987GH29R44GDpRUck7KLZ6M4TvKSyCpFgRaKaKub+OBoFQ@mail.gmail.com>
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

Ok. Thanks. Will take a try on this later.

---
ChunYeow

On Wed, Nov 26, 2014 at 9:50 AM, Ben Greear <greearb@candelatech.com> wrote:
> On 11/25/2014 05:48 PM, Yeoh Chun-Yeow wrote:
>> Is this the only patch we need to enable IBSS mode?
>> http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-3.17.dev.y/.git;a=commit;h=af9dabe5f23e2ad8f8603a5156ebe9227340e9e3
>>
>> Please advice. Thanks
>
> Sort of, but that is patching a previous patch of mine that is not upstream.
>
> So, you are going to have to go crawling through the code a bit
> to find out how to do a similar action in your code base.
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
