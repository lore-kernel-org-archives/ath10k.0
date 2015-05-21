Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvNid-00025u-EV
 for ath10k@lists.infradead.org; Thu, 21 May 2015 10:28:52 +0000
Received: from [192.168.0.21] ([80.206.126.150]) by mail.gmx.com (mrgmx102)
 with ESMTPSA (Nemesis) id 0LrqNe-1ZIwDP2sXe-013h8m for
 <ath10k@lists.infradead.org>; Thu, 21 May 2015 12:28:26 +0200
Message-ID: <555DB358.30209@gmx.com>
Date: Thu, 21 May 2015 12:28:40 +0200
From: Gabriele Martino <g.martino@gmx.com>
MIME-Version: 1.0
Subject: Re: QCA6174 hw2.1?
References: <trinity-d51578c9-4e28-4805-b58e-fdd5388949da-1426217948333@msvc-mesg-gmx002>
 <trinity-2097dd2e-b8b3-40c5-9eed-c0dc7d8690af-1426260485155@3capp-mailcom-lxa11>
 <CA+BoTQnKJE0w0SZrh-p2KaKe62t4=cRLnjeKu+t9aeE+LFce-w@mail.gmail.com>
 <loom.20150425T025815-684@post.gmane.org>
 <CAJAVYN208PQpnt5oQPi1hdYW71WMVJReBNSY-OqZ9aCb0yuiaA@mail.gmail.com>
 <553B8F89.4040908@gmx.com>
 <CAJAVYN1XKYdGqx4pzg3C9kSxj6_qwr4raoDJm7e+VLy1P=dsdw@mail.gmail.com>
 <553CF1EE.50807@gmx.com> <553D8112.2050300@gmx.com>
 <CA+-y_t-L5tAYRfT5+WzbB_EvZbWDO3hys9GD8Ms7fFhT_9cy_Q@mail.gmail.com>
 <553E5011.2050404@gmx.com>
 <CAJAVYN2WGEwrajUKFOpYPC7YWnovSs3pmQfjmP74hfwW-epJ2Q@mail.gmail.com>
 <CA+-y_t8pm+GPEaKX6cYta-Q4kiAd6mFKLO37nmS6pwPV63_VyA@mail.gmail.com>
 <5541722A.2060109@gmx.com>
 <CA+-y_t9Zq649otKN3B6tYrJ6_By7H3PEMtB4=aEeDXEG9C=1Rw@mail.gmail.com>
 <trinity-93dbb5d1-5337-4f4f-bb4f-4ad93c3ef3a6-1432135053019@3capp-mailcom-lxa14>
 <CAJHYP3gLAyoB771WJh0gzpZkmRHfm1E7h38ZsnU2ZnxQX8kcSQ@mail.gmail.com>
In-Reply-To: <CAJHYP3gLAyoB771WJh0gzpZkmRHfm1E7h38ZsnU2ZnxQX8kcSQ@mail.gmail.com>
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
To: ath10k@lists.infradead.org

I'm using the kvalo's kernel (4.1-rc3) without the patch, sometimes the
adapter loses connection but it's bearable.
I'll try that patch later. Killer N1525 on Alienware 15.

OT: Anton, does the headphone jack work correctly on your Alienware 15?
I sent a patch to the ALSA team about that.

On 21/05/2015 07:29, Anton Romanov wrote:
> Works fine for me with this patch
> https://patchwork.kernel.org/patch/6387631/  at least
> I am currently using self-extracted firmware but the one in the pr for
> ath10k-firmware worked fine as well iirc.
> I'm using that on Alienware 15 laptop with "Killer N1525"
>
> On Wed, May 20, 2015 at 8:17 AM, Jason H <jhihn@gmx.com> wrote:
>> I just wanted to check in and see what the status of support was for this hardware. I saw a few messages since I last posted.
>> I also need Linux 4 kernel for other issues with the hardware.
>>
>> Thanks!


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
