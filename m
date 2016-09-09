Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <87wpilp7x0.fsf@kamboji.qca.qualcomm.com>
References: <CAFBinCDnmEuSEKofHQy3SkKuewL+cjuxhibj7O71ASL0yfH_Ew@mail.gmail.com>
 <87wpilp7x0.fsf@kamboji.qca.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 Sep 2016 22:01:30 +0200
Message-ID: <CAFBinCCObRokj=1rja7nZ6DKMgFWDZAtoWMBJrxmsuq0mLUxkg@mail.gmail.com>
Subject: Re: support for QCA9377 SDIO (ath10k or ath6kl)
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath6kl@lists.infradead.org" <ath6kl@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, Sep 9, 2016 at 2:35 PM, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>> is there any support for the SDIO chips QCA9377 (and QCA9378) planned?
>> Would these be supported by ath10k or ath6kl or is a completely new
>> driver needed?
>
> I'm not familiar with the details of QCA9377 SDIO firmware but I assume
> ath10k would be the best option for supporting it. We split from the
> beginning the core code (ath10k_core.ko) and the PCI code
> (ath10k_pci.ko) to make it easier to add new bus support.
ath10k also gained AHB support some months ago, so it seems to allow
for multiple bus types.
however, that is only relevant if the QCA9377 SDIO firmware uses the
same interface as supported by ath10k -> could we get a statement from
the firmware team about this?

is QCA planning to add SDIO support to ath10k or would this have to be
done by a community developer?


Regards,
Martin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
