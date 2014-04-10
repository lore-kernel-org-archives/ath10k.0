Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY5wI-0000Ia-Jy
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 03:46:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFT 0/4] ath10k: fix flushing and tx stalls
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <5341F1A9.2030202@candelatech.com>
 <CA+BoTQndgEB7X-RUPPkxdjnp96LJzbv6=Q9K4XTTrky-QwE4Ww@mail.gmail.com>
 <53435F89.60500@candelatech.com>
 <CA+BoTQk6G4-h8HQENbK9snrXo6j6FW4D+07XKZMEEuvWiu03ww@mail.gmail.com>
 <53441D95.9000409@candelatech.com>
 <CA+BoTQkCDiUiV7dsg-myOZXQEB=B7JHH8NWm5BHsp1xExjLkSA@mail.gmail.com>
 <5345849A.5090603@candelatech.com>
Date: Thu, 10 Apr 2014 06:45:39 +0300
In-Reply-To: <5345849A.5090603@candelatech.com> (Ben Greear's message of "Wed, 
 09 Apr 2014 10:34:18 -0700")
Message-ID: <87eh15j198.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> My version of supplicant does not support -T.  I have just sync'd down the
> latest upstream hostapd code and will see if that adds the support.

You need to enable CONFIG_DEBUG_LINUX_TRACING in wpasupplicant.

http://wireless.kernel.org/en/developers/Documentation/mac80211/tracing

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
