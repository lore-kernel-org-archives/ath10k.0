Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIuCN-0003s9-71
 for ath10k@lists.infradead.org; Wed, 04 Feb 2015 07:16:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:Prevent setting wrong key idx for station
References: <1422369059-21274-1-git-send-email-senthilb@qti.qualcomm.com>
Date: Wed, 4 Feb 2015 09:15:55 +0200
In-Reply-To: <1422369059-21274-1-git-send-email-senthilb@qti.qualcomm.com>
 (senthilb@qti.qualcomm.com's message of "Tue, 27 Jan 2015 20:00:59
 +0530")
Message-ID: <87egq6w3is.fsf@kamboji.qca.qualcomm.com>
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
To: senthilb@qti.qualcomm.com
Cc: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>, ath10k@lists.infradead.org

<senthilb@qti.qualcomm.com> writes:

> From: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
>
> Ath10k driver sets wrong default key idx that results in
> sending unicast frames with multicast key.
>
> The reason for this behavior is that cached broadcast key
> is installed for station MAC address on association. After
> dot1x completes, unicast key is installed for station
> MAC address. Default key idx is set to broadcast key id when
> driver tries to send broadcast frame. This causes firmware
> to use broadcast key id to transmit unicast frames to stations.
>
> Used TX_USAGE flag to set default key for stations.
>
> Added callback for setting unicast default idx which will be
> invoked on every default key idx configuration.
>
> Signed-off-by: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>

Thanks, applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
