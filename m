Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xy0Ro-0003y9-Es
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 15:42:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 0/8] ath10k: add support for new wmi-tlv backend
References: <20141203080803.31187.85059.stgit@potku.adurom.net>
Date: Mon, 8 Dec 2014 17:41:31 +0200
In-Reply-To: <20141203080803.31187.85059.stgit@potku.adurom.net> (Kalle Valo's
 message of "Wed, 3 Dec 2014 10:09:16 +0200")
Message-ID: <87wq62ywr8.fsf@kamboji.qca.qualcomm.com>
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

> here's v4 of Michal's patches to add WMI TLV interface support to
> ath10k.

[...]

> Kalle Valo (4):
>       ath10k: clean up error handling in ath10k_core_probe_fw()
>       ath10k: create ath10k_core_init_features()
>       ath10k: add ATH10K_FW_IE_WMI_OP_VERSION
>       ath10k: set max_num_pending_tx in ath10k_core_init_firmware_features()
>
> Michal Kazior (4):
>       ath10k: implement intermediate event args
>       ath10k: introduce wmi ops
>       ath10k: make some wmi functions public
>       ath10k: implement wmi-tlv backend

All four applied. Thanks Michal.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
