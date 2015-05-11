Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yrs9g-0005JG-LV
 for ath10k@lists.infradead.org; Mon, 11 May 2015 18:10:19 +0000
Received: from [192.168.69.6] ([82.50.138.75]) by mail.gmx.com (mrgmx103) with
 ESMTPSA (Nemesis) id 0MMTZa-1YrJuw2ghS-008Lxe for
 <ath10k@lists.infradead.org>; Mon, 11 May 2015 20:09:53 +0200
Message-ID: <5550F07E.7010701@gmx.com>
Date: Mon, 11 May 2015 20:10:06 +0200
From: Gabriele Martino <g.martino@gmx.com>
MIME-Version: 1.0
Subject: Re: ath10k: freeze after disconnection on killer1525
References: <5550A5A4.8080908@gmx.com>
 <CA+BoTQk0Lca7mUfELjeHSbY_fiExTopga9J74khnOPkzEU01Xg@mail.gmail.com>
In-Reply-To: <CA+BoTQk0Lca7mUfELjeHSbY_fiExTopga9J74khnOPkzEU01Xg@mail.gmail.com>
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

On 11/05/2015 15:30, Michal Kazior wrote:
> On 11 May 2015 at 14:50, Gabriele Martino <g.martino@gmx.com> wrote:
>> Hi,
>> I'm using a Killer 1525 with hw2.1 firmware, and sometimes it stop working.
>> I can get it working again disconnecting and reconnecting, but sometimes
>> on disconnection it freezes for a long time:
>>
>> [ 2740.035190] dmar: DRHD: handling fault status reg 2
>> [ 2740.035195] dmar: DMAR:[DMA Read] Request device [03:00.0] fault addr
>> ffbeb000
>>                DMAR:[fault reason 06] PTE Read access is not
>> set
> This looks like DMA tx pool memory address. I suspect
> firmware/hardware tried to access memory which was already unmapped by
> ath10k.
>
> If you're feeling lucky you could disable IOMMU - this should prevent
> from crashing and disconnecting. However this is hardly a solution
> unless you're okay with the device reading random memory and doing
> *stuff* with it (plaintext password from RAM sent on the air, anyone?
> :-)
This seems even worse than the problem itself :-)
Other ideas? Should I provide other logs?

Regards,
Gabriele

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
