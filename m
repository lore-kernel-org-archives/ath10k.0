Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzRqb-0006Ux-6u
 for ath10k@lists.infradead.org; Thu, 19 Nov 2015 16:14:09 +0000
Subject: Re: QCA998X not working at all
References: <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
 <1447826363-16818-1-git-send-email-michal.kazior@tieto.com>
 <1447826363-16818-10-git-send-email-michal.kazior@tieto.com>
 <564DE65C.9030407@dd-wrt.com> <564DEBBE.1040308@candelatech.com>
 <564DEC25.1030401@dd-wrt.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <564DF53C.50009@candelatech.com>
Date: Thu, 19 Nov 2015 08:13:48 -0800
MIME-Version: 1.0
In-Reply-To: <564DEC25.1030401@dd-wrt.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath10k@lists.infradead.org

On 11/19/2015 07:35 AM, Sebastian Gottschall wrote:
> Am 19.11.2015 um 16:33 schrieb Ben Greear:
>> On 11/19/2015 07:10 AM, Sebastian Gottschall wrote:
>>>   6.064984] ath10k_pci 0000:01:00.0: enabling device (0140 -> 0142)
>>> [    6.065432] ath10k_pci 0000:01:00.0: pci irq legacy interrupts 0 irq_mode 0 reset_mode 0
>>> [    8.448583] ath10k_pci 0000:01:00.0: unable to read from the device
>>> [    8.448614] ath10k_pci 0000:01:00.0: could not execute otp for board id check: -110
>>> [    8.453657] ath10k_pci 0000:01:00.0: failed to get board id from otp for qca99x0: -110
>>> [    8.461352] ath10k_pci 0000:01:00.0: could not probe fw (-110)
>>>
>>>
>>> it seems that the there is some sort of problem with the otp. unfortunatly ath10k gives also no usefull information about the reason.
>>> this is a embedded ap148 based device (ipq8064) with QCA998X chipsets on it
>>
>> What kernel, what firmware, what board.bin are you using?
> plain ath10k with kernel 3.18.23. standard firmware-5 from ath10k github, same for board.

The kernel tree below at least booted up the 4x4 NIC for me with stock upstream firmware.

http://dmz2.candelatech.com/git/gitweb.cgi?p=linux.ath/.git;a=summary

git clone git://dmz2.candelatech.com/linux.ath

It has most of my patch-set applied...but not sure any of those patches
are really needed for basic functionality.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
