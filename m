Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpKau-0008Tm-M9
 for ath10k@lists.infradead.org; Mon, 04 May 2015 17:55:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add ATH10K_FW_FEATURE_IGNORE_OTP_RESULT
References: <20150427142438.25600.26537.stgit@potku.adurom.net>
Date: Mon, 4 May 2015 20:55:01 +0300
In-Reply-To: <20150427142438.25600.26537.stgit@potku.adurom.net> (Kalle Valo's
 message of "Mon, 27 Apr 2015 17:24:38 +0300")
Message-ID: <874mnsw7m2.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> qca6174 otp binary seems to always return an error to the host, even if the
> calibration succeeded. Add a firmware feature flag to detect if the firmware
> image which have this problem and workaround the issue in ath10k by ignoring
> the error code.
>
> I was also considering making this hw specific flag but as this is strictly a
> firmware issue it's best to handle this via a firmware feature flag so that it
> will be easy to disable the workaround.
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
