Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xozmh-0002vJ-Gq
 for ath10k@lists.infradead.org; Thu, 13 Nov 2014 19:10:24 +0000
Received: by mail-qg0-f43.google.com with SMTP id f51so11157531qge.30
 for <ath10k@lists.infradead.org>; Thu, 13 Nov 2014 11:10:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQk7idFbyYzLxKCgmSQ=zzQTraOJ-fy5_qhDpzkueQe8KQ@mail.gmail.com>
References: <CAD1M060Y+3r_-J12ZqT4TqddUf9tJHKCEPJ0DhFJ1sCiXimdVw@mail.gmail.com>
 <5461382B.6070607@candelatech.com>
 <CAD1M062xcGu2EJzxaXYQt5uHyDxHpEE+FDiPB4SBirXX5ePz_A@mail.gmail.com>
 <54613C13.9010008@candelatech.com>
 <CAD1M061wRo5MqmKYy8jw9fKpraA0DFJTh4k+QNzLkayLmBttfA@mail.gmail.com>
 <CA+BoTQk7idFbyYzLxKCgmSQ=zzQTraOJ-fy5_qhDpzkueQe8KQ@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Thu, 13 Nov 2014 11:09:31 -0800
Message-ID: <CAD1M063n=WGeQRJKycvWYGMZRFN4gabM56dgeX_4tf8W8hyUKA@mail.gmail.com>
Subject: Re: htt rx stopped. cannot recover
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Nov 11, 2014 at 10:31 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> That's a safety mechanism to prevent memory corruption on the host.
> The error you see is most likely an indication fw/hw Rx reporting
> broke, i.e. fw says to pop more frames from the Rx ring than it is
> ready to be popped.

So if this seems to indicate a hw/fw issue, how should I go about
fixing it? If it's a fw issue, it just goes to show how keeping this
particular fw closed-source is hurting this project more than anything
in my opinion.

Has anyone else been able to recreate this problem? If not, there
might be something else at play, but until someone else can recreate
the issue, I can't tell exactly where the problem lies. At first I
thought it was a 4addr mode issue, but I performed the following
scenario and believe that it might be related to bridging.
 {lan1}<--ether-->AP<--wifi-->STA

In this scenario, the AP bridges eth+wlan, with 4addr turned off (the
STA has no bridge). When I pass traffic through from lan1 to the
STAtion, the same issue occurs on the AP, this time with traffic above
~220mbps TCP. Does anyone know of any specific kernel configs relating
to bridging that I might not have enabled?

I understand that stopping traffic is a safety mechanism, but is there
a better way to handle the situation? I don't believe resetting
hardware is the proper solution as this requires reauthentication
(which takes time), only for the problem to remanifest itself in only
a few seconds of passing traffic through.

Thanks for any input,
Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
