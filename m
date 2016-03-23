Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aihaA-000838-Ob
 for ath10k@lists.infradead.org; Wed, 23 Mar 2016 12:08:15 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] dt: bindings: add new dt entry for pre calibration in
 qcom, ath10k.txt
Date: Wed, 23 Mar 2016 12:07:49 +0000
Message-ID: <87poulfld8.fsf@kamboji.qca.qualcomm.com>
References: <1457604724-14378-1-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1457604724-14378-1-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Thu, 10 Mar 2016 15:42:04 +0530")
Content-Language: en-US
Content-ID: <58C490DB42889445B42B5F44F353681D@qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "robh@kernel.org" <robh@kernel.org>

Raja Mani <rmani@qti.qualcomm.com> writes:

> There two things done in this patch,
>
> 1) Existing device tree entry 'qcom,ath10k-calibration-data' carries
>    not only calibration data, it carries board specific data too.
>    So, make appropriate update in doc.
>
> 2) ipq4019 wifi needs new devie tree entry to carry calibration
>    data alone (called pre cal data, it doesn't include any other info).
>    Using 'qcom,ath10k-calibration-data' for ipq4019 would alter
>    the purpose of it. Hence, add new device tree entry called
>    'qcom,ath10k-pre-calibration-data' to carry only pre calibration data.
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
