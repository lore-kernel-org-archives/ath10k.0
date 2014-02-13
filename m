Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDtXz-0001XK-Td
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 10:29:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: Get rid of superfluous call to
 pci_disable_msi()
References: <cover.1389904166.git.agordeev@redhat.com>
 <ad5cc6d6bdf4c8f5ce4681ec27674d07fbda089e.1389904167.git.agordeev@redhat.com>
 <20140130134819.GA31909@dhcp-26-207.brq.redhat.com>
 <87y51qohjn.fsf@kamboji.qca.qualcomm.com>
 <20140204190935.GA1430@dhcp-26-207.brq.redhat.com>
 <8761oum0l3.fsf@kamboji.qca.qualcomm.com>
 <20140205085047.GA27820@dhcp-26-207.brq.redhat.com>
 <871tzilz1u.fsf@kamboji.qca.qualcomm.com>
 <20140212003143.GD21057@google.com>
 <20140212133816.GB3147@dhcp-26-207.brq.redhat.com>
 <CAErSpo6c_EPc5c8aaTeD9=eXWw4OowcKhWHG6YZgTOkZRMtZHQ@mail.gmail.com>
 <87ppmsauij.fsf@kamboji.qca.qualcomm.com>
 <CAErSpo47k8WuHded1TnHoRedHHLe-Sk7kKsXcR4XjKmQPb0Ggg@mail.gmail.com>
Date: Thu, 13 Feb 2014 12:29:04 +0200
In-Reply-To: <CAErSpo47k8WuHded1TnHoRedHHLe-Sk7kKsXcR4XjKmQPb0Ggg@mail.gmail.com>
 (Bjorn Helgaas's message of "Wed, 12 Feb 2014 14:40:26 -0700")
Message-ID: <87mwhv9uha.fsf@kamboji.qca.qualcomm.com>
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
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Alexander Gordeev <agordeev@redhat.com>, linux-wireless <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Bjorn Helgaas <bhelgaas@google.com> writes:

> On Wed, Feb 12, 2014 at 2:30 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Bjorn Helgaas <bhelgaas@google.com> writes:
>>
>>>> Well, as this series is small I thought it could quickly go thru your
>>>> tree. But since ipr had conflicts, there is no point routing all patches
>>>> altogether, so up to you guys. The wil6210 patch is already in your pci/msi
>>>> branch though.
>>>
>>> It's in pci/msi, but that's not in my -next branch yet, so I can
>>> easily drop it.  Do drivers/net/wireless patches normally follow a
>>> different path than the other drivers/net patches?  The wil6210 and
>>> ath10k patches look just like the others in the 34-patch series (bnx2,
>>> bnx2x, tg3, bna, cxgb3, etc.), so I thought it would make more sense
>>> to include them there.
>>
>> ath10k patches normally go through my ath.git tree to Linville and then
>> to David Miller. To avoid conflicts I would prefer to take ath10k
>> patches to my tree whenever possible.
>
> OK, I won't do anything with ath10k (I haven't applied it anywhere).

I have now taken the ath10k patches to my pending branch, will apply
them soon.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
