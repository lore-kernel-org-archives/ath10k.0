Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z33HB-00032H-TM
 for ath10k@lists.infradead.org; Thu, 11 Jun 2015 14:16:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: enable VHT for IBSS
References: <1433913284-18444-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Thu, 11 Jun 2015 17:15:42 +0300
In-Reply-To: <1433913284-18444-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Wed, 10 Jun 2015 07:14:44 +0200")
Message-ID: <87mw06bab5.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Enable VHT support for IBSS, while mac80211/cfg80211 and
> wpa_supplicant already support this.
>
> In my test env, ath10k 2x2 I get:
> (udp) ath10k-1 >>>> ath10k-2 (server) -  speed: 419 Mbits/sec
> (tcp) ath10k-1 >>>> ath10k-2 (server) -  speed: 404 Mbits/sec

What hw and firmware version? Do you expect this to work with both
qca988x and qca6174?

Oh, we should still add ATH10K_FW_FEATURE_NO_ADHOC so that we can
disable ad-hoc on 10.x firmwares. Anyone have some spare time to cook up
a patch?

> During tests I used wpa_supplicant (current version)

Better to say "current git version" (if that's what you mean).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
