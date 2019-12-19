Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihwnp-0001tY-DD
 for ath10k@lists.infradead.org; Thu, 19 Dec 2019 14:29:22 +0000
Received: by mail-ed1-x541.google.com with SMTP id dc19so5040934edb.10
 for <ath10k@lists.infradead.org>; Thu, 19 Dec 2019 06:29:21 -0800 (PST)
Subject: Re: [PATCH 1/2] ath10k: pci: Only dump ATH10K_MEM_REGION_TYPE_IOREG
 when safe
References: <20191219131539.1003793-1-bryan.odonoghue@linaro.org>
 <20191219131539.1003793-2-bryan.odonoghue@linaro.org>
 <87woas5slt.fsf@kamboji.qca.qualcomm.com>
 <38bf1f75-0554-920a-0f29-354e70cfc077@linaro.org>
 <87sglg5rb0.fsf@kamboji.qca.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <4a8b7913-c9b9-dd67-124d-b4f71747c849@linaro.org>
Date: Thu, 19 Dec 2019 14:29:40 +0000
MIME-Version: 1.0
In-Reply-To: <87sglg5rb0.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 19/12/2019 14:21, Kalle Valo wrote:
> 'dmesg | grep ath10k' should show it.


[    6.579772] ath10k_pci 0000:01:00.0: firmware ver 10.4-3.9.0.2-00044 
api 5 features 
no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast,no-ps crc32 
c3e1b393


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
