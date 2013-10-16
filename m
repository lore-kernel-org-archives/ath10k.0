Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWTTt-0004oF-TY
 for ath10k@lists.infradead.org; Wed, 16 Oct 2013 15:57:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 7/8] ath10k: fix device initialization routine
References: <20131016134503.25095.8044.stgit@localhost6.localdomain6>
 <20131016134617.25095.10581.stgit@localhost6.localdomain6>
 <CA+BoTQkqkuf-=a4giyJHeYdXZ2T3deU7nmuQOxpFcKSzWjGb3Q@mail.gmail.com>
Date: Wed, 16 Oct 2013 18:57:20 +0300
In-Reply-To: <CA+BoTQkqkuf-=a4giyJHeYdXZ2T3deU7nmuQOxpFcKSzWjGb3Q@mail.gmail.com>
 (Michal Kazior's message of "Wed, 16 Oct 2013 08:44:32 -0700")
Message-ID: <87ppr55hun.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

>> +       /* disable pending irqs */
>> +       ath10k_pci_core_write32(ar, PCIE_INTR_ENABLE_ADDRESS, 0);
>> +       ath10k_pci_core_write32(ar, PCIE_INTR_CLR_ADDRESS, ~0);
>
> These use SOC_CORE_BASE_ADDRESS as the suffix, not the RTC_SOC_BASE_ADDRESS.

But I am using SOC_CORE_BASE_ADDRESS, right?

static inline u32 ath10k_pci_core_read32(struct ath10k *ar, u32 addr)
{
	return ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS + addr);
}

static inline void ath10k_pci_core_write32(struct ath10k *ar, u32 addr, u32 val)
{
	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + addr, val);
}

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
