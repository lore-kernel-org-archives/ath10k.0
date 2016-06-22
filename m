Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFbwo-0006TN-34
 for ath10k@lists.infradead.org; Wed, 22 Jun 2016 06:47:38 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Cannot initialize Compex WLE600VX for 802.11ac?
Date: Wed, 22 Jun 2016 06:47:12 +0000
Message-ID: <87y45xiuts.fsf@kamboji.qca.qualcomm.com>
References: <57dtwgmmwmr.fsf@cerise.info9.net>
In-Reply-To: <57dtwgmmwmr.fsf@cerise.info9.net> (Tom Marble's message of "Tue, 
 21 Jun 2016 09:42:20 -0500")
Content-Language: en-US
Content-ID: <8CCDD634C4B9EC40AD59AADFA597003B@qualcomm.com>
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
To: Tom Marble <tmarble@info9.net>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Tom Marble <tmarble@info9.net> writes:

> Setting channel=0 to enable scanning results in finding channel 52
> as the ideal channel, but then (full log in [7])...
> # hostapd -dd /etc/hostapd/wlan0.conf | tee /tmp/wlan0.log
> ... 
>   Mode: IEEE 802.11a  Channel: 52  Frequency: 5260 MHz
>   DFS 0 channels required radar detection
>   Could not set channel for kernel driver
>   Interface initialization failed
>
> Setting channel=52 and trying again fails with... (full log in [8]).
> # hostapd -dd /etc/hostapd/wlan0.conf | tee /tmp/wlan0-52.log
> ...
>   nl80211: Failed to start radar detection: -16 (Device or resource busy)
>
>
> What suggestions do you have to help me identify the cause of 
> this problem (and hopefully resolve it!)?

Do you have CONFIG_ATH10K_DFS_CERTIFIED enabled? Also check that that
regulatory is correct with 'iw reg get' and 'iw phy0 info', especially
that 80 MHz channels are supported.

Also I would try first without DFS on channel 36 just to make it easier
to pinpoint the problem.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
