Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zj7j2-0008Uy-9t
 for ath10k@lists.infradead.org; Mon, 05 Oct 2015 15:30:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: Use station's current operating mode from
 assoc request
References: <1443168068-5719-1-git-send-email-nataraja@qti.qualcomm.com>
Date: Mon, 5 Oct 2015 18:30:17 +0300
In-Reply-To: <1443168068-5719-1-git-send-email-nataraja@qti.qualcomm.com>
 (Vivek Natarajan's message of "Fri, 25 Sep 2015 13:31:08 +0530")
Message-ID: <87twq52v06.fsf@kamboji.qca.qualcomm.com>
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
To: Vivek Natarajan <nataraja@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vivek Natarajan <nataraja@qti.qualcomm.com> writes:

> The current number of spatial streams used by the client is advertised
> as a separate IE in assoc request. Use this information to set
> the NSS operating mode.
>
> Fixes: 45c9abc059fa ("ath10k: implement more versatile set_bitrate_mask").
> Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>

This adds a new warning:

drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_peer_assoc_h_ht':
drivers/net/wireless/ath/ath10k/mac.c:2172:131: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/net/wireless/ath/ath10k/mac.c:2172:49: error: incompatible types in comparison expression (different type sizes)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
