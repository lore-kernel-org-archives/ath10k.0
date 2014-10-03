Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa68P-0006tT-No
 for ath10k@lists.infradead.org; Fri, 03 Oct 2014 16:55:14 +0000
Received: by mail-lb0-f172.google.com with SMTP id b6so1353433lbj.17
 for <ath10k@lists.infradead.org>; Fri, 03 Oct 2014 09:54:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2162399.E7Ru1MI0QH@wuerfel>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <2386503.dNPayhXJTQ@wuerfel>
 <20141003162513.GW26643@leverpostej> <2162399.E7Ru1MI0QH@wuerfel>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 3 Oct 2014 09:54:30 -0700
Message-ID: <CALCETrWC9fXckgUGYWA8AcHT5SoxQc-EouV0U-sFr7v6279oow@mail.gmail.com>
Subject: Re: ath10k: calibration data through Device Tree?
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, Oct 3, 2014 at 9:42 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday 03 October 2014 17:25:13 Mark Rutland wrote:
>> > From a system design point, it's still horrible that you have to use
>> > DT for a device that is on a discoverable bus like PCI, but as you describe,
>> > the reality is that products are shipping that use ath10k PCI devices
>> > without this data in them.
>>
>> I'd see any DT property for this as a workaround, the use of which
>> should be discouraged.
>
> By extension though, any use of DT is really a workaround for the fact
> that embedded systems and SoCs don't use discoverable buses, and it should
> be discouraged. x86 SoCs actually get this right to a large degree by
> making on-chip devices appear as PCI devices that can be used standalone,
> although Intel's latest generation SoCs are regressing in this regard
> and you still need DT (or something like it) to describe off-chip devices
> there.
>
>> A fun question that springs to mind is can the ath10k chip be removed,
>> and if so am I able to place it into a non-DT system (whereupon I have
>> no calibration data, so it won't work)?
>
> Some can be removed, others cannot. If the chip is on a removable pcie
> mini card and doesn't have that data on the card itself, it's already
> impossible to put it into another system. I don't think we need to solve
> that case.

Do these minipcie devices have any sort of unique identifier?  If so,
one could shove the calibration data in
/lib/firmware/ath10k/caldata_[CARDID].dat and, as long as that file
followed the minipcie card around, it would work just fine.

--Andy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
