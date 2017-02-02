Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZC8m-0003c2-Ls
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 07:49:14 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Recent driver changes destabilized QCA9377 connection quality
Date: Thu, 2 Feb 2017 07:48:49 +0000
Message-ID: <8737fxowx5.fsf@kamboji.qca.qualcomm.com>
References: <20170129104829.GA3440@lichtkranz.fritz.box>
In-Reply-To: <20170129104829.GA3440@lichtkranz.fritz.box> (Tobias Predel's
 message of "Sun, 29 Jan 2017 11:48:30 +0100")
Content-Language: en-US
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
To: Tobias Predel <tobias.predel@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Tobias Predel <tobias.predel@gmail.com> writes:

> I just want to report a negative development I have been experiencing
> for a week now.
>
> Recent changes in ath10k driver code seem to destabilize QCA9377
> connection quality in 802.11b/g networks, as hardware and software
> configuration (wpa_supplicant) hasn't changed. Before, I have managed
> to have a fair connection quality for around three months. At the
> moment I encounter multiple connection losses.
>
> dmesg reports usual losses and timeouts on both linux-lts 4.4.44 and
> linux 4.8.13 (Arch Linux).
>
> Please restore former functionality.

You mention recent changes, so what kernel exact version works without
problems? Has the firmware version remained the same all the time?

If it's a regression in kernel, can you bisect to find the commit which
broke it? You would need to compile your own kernels to do that.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
