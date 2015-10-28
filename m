Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrWVc-00031u-1u
 for ath10k@lists.infradead.org; Wed, 28 Oct 2015 19:35:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv3] ath10k: Enable adaptive CCA
References: <1444817777-12195-1-git-send-email-c_mkenna@qti.qualcomm.com>
Date: Wed, 28 Oct 2015 21:35:00 +0200
In-Reply-To: <1444817777-12195-1-git-send-email-c_mkenna@qti.qualcomm.com> (c.
 mkenna's message of "Wed, 14 Oct 2015 15:46:17 +0530")
Message-ID: <87vb9qss63.fsf@kamboji.qca.qualcomm.com>
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
To: c_mkenna@qti.qualcomm.com
Cc: Manikanta Pubbisetty <c_mpubbi@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

<c_mkenna@qti.qualcomm.com> writes:

> From: Maharaja <c_mkenna@qti.qualcomm.com>
>
> European Union has made it mandatory that all devices working in 2.4 GHz
> has to adhere to the ETSI specification (ETSI EN 300 328 V1.9.1)
> beginnig this year. The standard basically speaks about interferences
> in 2.4Ghz band.
> For example, when 802.11 device detects interference, TX must be stopped
> as long as interference is present.
>
> Adaptive CCA is a feature, when enabled the device learns from the
> environment and configures CCA levels adaptively. This will improve
> detecting interferences and the device can stop trasmissions till the
> interference is present eventually leading to good performances in
> varying interference conditions.
>
> The patch includes code for enabling adaptive CCA for 10.2.4 firmware on
> QCA988X.
>
> Signed-off-by: Maharaja <c_mkenna@qti.qualcomm.com>
> Signed-off-by: Manikanta Pubbisetty <c_mpubbi@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
