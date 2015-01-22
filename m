Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YEOzR-00065i-Oh
 for ath10k@lists.infradead.org; Thu, 22 Jan 2015 21:08:34 +0000
Message-ID: <54C166B8.7060405@candelatech.com>
Date: Thu, 22 Jan 2015 13:08:08 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: More than one ath10k NIC will not load (bisected)
References: <54BECE4D.9020308@candelatech.com> <54BF0B42.7050101@dd-wrt.com>
 <54BF13AE.5010909@candelatech.com> <54BFF788.2000500@candelatech.com>
 <54C00239.7000008@candelatech.com>
In-Reply-To: <54C00239.7000008@candelatech.com>
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
To: ath10k@lists.infradead.org, Michal Kazior <michal.kazior@tieto.com>


On 01/21/2015 11:47 AM, Ben Greear wrote:
> On 01/21/2015 11:01 AM, Ben Greear wrote:
>> On 01/20/2015 06:49 PM, Ben Greear wrote:
>>> On 01/20/2015 06:13 PM, Sebastian Gottschall wrote:
>>>> Am 20.01.2015 um 22:53 schrieb Ben Greear:
>>>>> I tried running a patched version of 3.19.0-rc5 kernel, and it seems to work
>>>>> fine when there is one ath10k NIC in the system, but when there is two it
>>>>> doesn't try to load the firmware.

Ok, this bisects to this commit.  First (or sometimes second) NIC will load,
but the other one will not load firmware.  No obvious errors in dmesg.

Platform is x86-64, Fedora 20.  NICS:

03:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac Wireless Network Adapter
04:00.0 Network controller: Qualcomm Atheros QCA988x 802.11ac Wireless Network Adapter


7c0f0e3c9797e5a08d15da68812f24eadaf9e82b is the first bad commit
commit 7c0f0e3c9797e5a08d15da68812f24eadaf9e82b
Author: Michal Kazior <michal.kazior@tieto.com>
Date:   Mon Oct 20 14:14:38 2014 +0200

    ath10k: mask/unmask msi fw irq

    This was the final missing bit to making sure the
    device doesn't assert interrupts to host.

    This should fix possible race when target crashes
    during driver teardown.

    This also removes an early warm reset workaround
    during pci probing.

    Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

:040000 040000 f7ab5ff9f7e3713118dab6f23d02f11003de6fef fa5cb5ee76bdee2c654fcb8e6b8b1283c225bcc2 M	drivers

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
