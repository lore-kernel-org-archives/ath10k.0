Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkTBo-0004Tx-CQ
 for ath10k@lists.infradead.org; Fri, 09 Oct 2015 08:38:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: Use station's current operating mode from
 assoc request
References: <1444060928-5702-1-git-send-email-nataraja@qti.qualcomm.com>
Date: Fri, 9 Oct 2015 11:37:36 +0300
In-Reply-To: <1444060928-5702-1-git-send-email-nataraja@qti.qualcomm.com>
 (Vivek Natarajan's message of "Mon, 5 Oct 2015 21:32:08 +0530")
Message-ID: <87d1wosai7.fsf@kamboji.qca.qualcomm.com>
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

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
