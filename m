Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGNv9-0006Qw-T8
 for ath10k@lists.infradead.org; Wed, 28 Jan 2015 08:24:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:Prevent setting wrong key idx for station
References: <1422369059-21274-1-git-send-email-senthilb@qti.qualcomm.com>
Date: Wed, 28 Jan 2015 10:23:35 +0200
In-Reply-To: <1422369059-21274-1-git-send-email-senthilb@qti.qualcomm.com>
 (senthilb@qti.qualcomm.com's message of "Tue, 27 Jan 2015 20:00:59
 +0530")
Message-ID: <87d25z9uuw.fsf@kamboji.qca.qualcomm.com>
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

I had a trivial conflict in ath10k_add_interface(), please double check
my conflict resolution in the pending branch:

https://github.com/kvalo/ath/commit/34e5197d250d7be04bba5ad2b2d33cd9a7c41b0f

And in the future please also CC linux-wireless when submitting ath10k
patches.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
