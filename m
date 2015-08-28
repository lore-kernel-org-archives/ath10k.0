Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVJ52-0005EX-5n
 for ath10k@lists.infradead.org; Fri, 28 Aug 2015 12:48:30 +0000
Received: by wieo17 with SMTP id o17so14589647wie.0
 for <ath10k@lists.infradead.org>; Fri, 28 Aug 2015 05:48:04 -0700 (PDT)
From: Sven Eckelmann <sven@open-mesh.com>
Subject: Re: CT firmware and linux kernel patches for OpenWRT( ar71xx -
 Tp-Link 1750AC )
Date: Fri, 28 Aug 2015 14:48:02 +0200
Message-ID: <2249526.TmOlA3g2Uo@bentobox>
In-Reply-To: <CAJa-X96RZTQ_=dG+PDxu8x_AeMAXhyKiTc7CrNO=hqhnmYAN-Q@mail.gmail.com>
References: <CAJa-X96RZTQ_=dG+PDxu8x_AeMAXhyKiTc7CrNO=hqhnmYAN-Q@mail.gmail.com>
MIME-Version: 1.0
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
To: s prasad <sprasad.kandregula@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On Wednesday 26 August 2015 18:59:51 s prasad wrote:
> Does anybody have patches for CT firmware testing using OpenWRT environment.
> I tried to create patch, however OpenWRT patches supporting only for
> kernel versions 3.18 and 4.1 at the same time CT Kernels supporting
> 3.17_dev, 4.0.4 and 4.2.x. Both are miss matching.

You have to patch mac80211 and not the kernel. I can give you the patchset
I've used with OpenWrt r46435.

You should get it in the next minutes via private mail (I don't want to
send it over the mailing list due to its size). It is basically the
patchset from Ben put on top of compat-wireless 2015-06-22 [1].

You still need extra changes to get VHT working over IBSS (iw will
otherwise only use HT). When you only want to test it then you can
just hardcode a channel + a channel width in iw's ibss.c.

Kind regards,
	Sven


[1] https://dev.cloudtrax.com/git/ath10k-ibss-test.git/shortlog/refs/heads/master-20150824


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
