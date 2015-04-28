Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn6o9-0003ME-4E
 for ath10k@lists.infradead.org; Tue, 28 Apr 2015 14:48:22 +0000
Message-ID: <553F9D9C.9080004@candelatech.com>
Date: Tue, 28 Apr 2015 07:47:56 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: attempting mesh on ath10k
References: <20150424125055.GA27722@localhost>
 <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
 <20150428124116.GC4527@localhost>
 <CAEFj987sVTAn8ABk70AhtDcr2wA+RTH6eXKtgOk26h=pZ5A-JA@mail.gmail.com>
 <20150428125748.GE4527@localhost>
In-Reply-To: <20150428125748.GE4527@localhost>
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
To: Bob Copeland <me@bobcopeland.com>, Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 04/28/2015 05:57 AM, Bob Copeland wrote:
> On Tue, Apr 28, 2015 at 08:50:01PM +0800, Chun-Yeow Yeoh wrote:
>> Great works, Bob.
>>
>> Which AP firmware that you have tested with?
>
> That is with:
>
> [   16.670000] ath10k_pci 0000:01:00.0: qca988x hw2.0 (0x4100016c,
> 0x043202ff) fw 10.2.4.45 api 4 htt 2.1 wmi 5 cal otp max_sta 128
>
> I think it should work with CT too.  I need to go back and validate
> that, and also make sure I can repro the AID crash on CT.  A confounding
> factor is that every time I build new drivers for OpenWRT, it overwrites
> the firmware again...


If you feel adventurous, and want to apply some of my ath10k patches,
I have a way to dump some of the interesting registers in CT firmware,
including the rx-filter register.

Maybe I can figure out what needs to be twiddled w/out having to add
a monitor device.

I could also potentially add a vdev type or flag for mesh interface,
but that would definitely require driver hacks to enable the new
flag and it would not be compatible with other upstream firmware.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
