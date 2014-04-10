Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY8JL-0002lO-Ax
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 06:18:08 +0000
Received: by mail-vc0-f175.google.com with SMTP id lh14so2948864vcb.6
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 23:17:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGsNzDJ4hDBa82bUFTQkUqjuRuKOaOVMJDsFZUUvdPGf+iKBdQ@mail.gmail.com>
References: <CAGsNzDJ4hDBa82bUFTQkUqjuRuKOaOVMJDsFZUUvdPGf+iKBdQ@mail.gmail.com>
Date: Thu, 10 Apr 2014 14:17:38 +0800
Message-ID: <CAEFj985jaYoB0fgoY7G0vstcPJTTtGGLy_unAaTWUKvKGDwChw@mail.gmail.com>
Subject: Re: WDS and adhoc support with ath10k
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
To: Aaron Ray <aaronmray@ohioitguy.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Just make sure that the adhoc mode is working first before proceed to WDS.

Be sure the firmware version is as follow:
[   13.810000] ath10k: qca988x hw2.0 (0x4100016c, 0x043202ff) fw
999.999.0.636 api 2 htt 2.1

I haven't tried the adhoc mode with WDS, but did try for managed and
AP interface.

I think that you need to turn on the 4addr flag in iw:
iw dev wlan0 set 4addr on

----
Chun-Yeow

On Thu, Apr 10, 2014 at 12:07 AM, Aaron Ray <aaronmray@ohioitguy.com> wrote:
> I've been exploring WDS support in OpenWRT and ath10k. I'm running the
> latest openwrt trunk as of this weekend and I'm NOT able to get WDS
> working on my ath10k card.
>
> No sta adapter is created also iw doesn't list any support for WDS.
> I'd like to get this working if anyone has any ideas.
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
