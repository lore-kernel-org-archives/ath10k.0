Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNTDo-0003jF-F5
 for ath10k@lists.infradead.org; Thu, 06 Aug 2015 22:01:09 +0000
Subject: Re: [PATCH] ath10k: Add QCA99X0 to supported device list
References: <1437478567-11339-1-git-send-email-vthiagar@qti.qualcomm.com>
 <55C1FFBC.7070905@openwrt.org> <55C31039.6030201@qti.qualcomm.com>
 <55C313D3.4080004@openwrt.org> <55C3AB2F.9030904@codeaurora.org>
From: Felix Fietkau <nbd@openwrt.org>
Message-ID: <55C3D905.6090207@openwrt.org>
Date: Fri, 7 Aug 2015 00:00:37 +0200
MIME-Version: 1.0
In-Reply-To: <55C3AB2F.9030904@codeaurora.org>
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
To: Peter Oh <poh@codeaurora.org>, Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org

On 2015-08-06 20:45, Peter Oh wrote:
> 
> On 08/06/2015 12:59 AM, Felix Fietkau wrote:
>> On 2015-08-06 09:43, Vasanthakumar Thiagarajan wrote:
>>> On Wednesday 05 August 2015 05:51 PM, Felix Fietkau wrote:
>>>> On 2015-07-21 13:36, Vasanthakumar Thiagarajan wrote:
>>>>> Add vendor/device id of QCA99X0 V2.0 to pci id table and
>>>>> QCA99X0_HW_2_0_CHIP_ID_REV to ath10k_pci_supp_chips[] for
>>>>> QCA99X0 to get detected by the driver.
>>>>>
>>>>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
>>>> I just tested a 99X0 card, and I'm getting this:
>>>>
>>>> [    8.742514] ath10k_pci 0000:01:00.0: enabling device (0140 -> 0142)
>>>> [    8.747173] ath10k_pci 0000:01:00.0: pci irq msi interrupts 1
>> irq_mode 0 reset_mode 0
>>>> [   11.793314] ath10k_pci 0000:01:00.0: failed to receive initialized
>> event from target: 00000000
>>>> [   11.793344] ath10k_pci 0000:01:00.0: failed to wait for target after
>> cold reset: -110
>>>> [   11.800814] ath10k_pci 0000:01:00.0: failed to reset chip: -110
>>>> [   11.809228] ath10k_pci: probe of 0000:01:00.0 failed with error -110
>>>>
>>>> This is on an AP148 board with Linux 3.18, backports generated from
>>>> latest wireless-testing (2015-08-03) + all patches from kvalo's ath
>>>> tree.
>>> Any idea about the version of AP148 that you are using?. By any chance
>> did
>>> you check if QCA988X is working on the same board?.
>> No idea about the version, but QCA988X is working in the same slot.
> QCA99X0 uses a different version of firmware from QCA988X.
> Could you verify which firmware version or file name is using?
ath10k/QCA99X0/hw2.0/firmware-5.bin_10.4.1.00007-1 from git is
/lib/firmware/ath10k/QCA99X0/hw2.0/firmware-5.bin on the device.

However, this error shows up even before it gets to the point of loading
the firmware.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
