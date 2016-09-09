Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: support for QCA9377 SDIO (ath10k or ath6kl)
Date: Fri, 9 Sep 2016 12:35:55 +0000
Message-ID: <87wpilp7x0.fsf@kamboji.qca.qualcomm.com>
References: <CAFBinCDnmEuSEKofHQy3SkKuewL+cjuxhibj7O71ASL0yfH_Ew@mail.gmail.com>
In-Reply-To: <CAFBinCDnmEuSEKofHQy3SkKuewL+cjuxhibj7O71ASL0yfH_Ew@mail.gmail.com>	(Martin
 Blumenstingl's message of "Thu, 8 Sep 2016 21:31:12 +0200")
Content-Language: en-US
Content-ID: <CE840B30169B194B85A14A77B99F7070@qualcomm.com>
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
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "ath6kl@lists.infradead.org" <ath6kl@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> is there any support for the SDIO chips QCA9377 (and QCA9378) planned?
> Would these be supported by ath10k or ath6kl or is a completely new
> driver needed?

I'm not familiar with the details of QCA9377 SDIO firmware but I assume
ath10k would be the best option for supporting it. We split from the
beginning the core code (ath10k_core.ko) and the PCI code
(ath10k_pci.ko) to make it easier to add new bus support.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
