Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8fCl-0001VM-Ij
 for ath10k@lists.infradead.org; Thu, 11 May 2017 03:55:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] [ath10k] go back to using dma_alloc_coherent() for
 firmware scratch memory.
Date: Thu, 11 May 2017 03:55:25 +0000
Message-ID: <87bmr0vyhe.fsf@kamboji.qca.qualcomm.com>
References: <20170501214327.5621-1-adrian@freebsd.org>
 <CAHjFwoAr6Tjh=Zpr_JhEp_-g_0XJ+LDUagsfJh=vqseqzBC1Pw@mail.gmail.com>
In-Reply-To: <CAHjFwoAr6Tjh=Zpr_JhEp_-g_0XJ+LDUagsfJh=vqseqzBC1Pw@mail.gmail.com>	(Su Kang
 Yin's message of "Thu, 11 May 2017 01:21:06 +0800")
Content-Language: en-US
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
To: Su Kang Yin <paradyse@gmail.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Su Kang Yin <paradyse@gmail.com> writes:

> Without this patch QCA9888 is not working. Also I have to update
> board2.bin from Kalle's git repo.

More details would be good to know, as the behaviour seems to vary quite
a lot. What platform are you using, x86, some ARM board or what? And
what kernel exactly?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
