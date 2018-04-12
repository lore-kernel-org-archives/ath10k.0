Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6f8s-0000Xn-Hh
 for ath10k@lists.infradead.org; Thu, 12 Apr 2018 16:32:12 +0000
Subject: Re: Please add new board files for WLE1216V5-20 and another Compex
 NIC.
References: <044ffe4d-4c50-4aeb-392c-aea9a813ebb4@candelatech.com>
 <CAJ+vNU1MSa3iR7dAW6M+TiKutzyYSeT3p4H0J8L_W3mTTEtyzQ@mail.gmail.com>
 <2080980.pDnGlZTBzu@bentobox>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <0fb4c68f-ad37-9346-30b9-d57516848a55@candelatech.com>
Date: Thu, 12 Apr 2018 09:31:54 -0700
MIME-Version: 1.0
In-Reply-To: <2080980.pDnGlZTBzu@bentobox>
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>, ath10k@lists.infradead.org
Cc: Christian Lamparter <chunkeey@googlemail.com>, Tim Harvey <tharvey@gateworks.com>, Chris Blake <chrisrblake93@gmail.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>

On 04/12/2018 12:27 AM, Sven Eckelmann wrote:
> On Mittwoch, 11. April 2018 08:18:15 CEST Tim Harvey wrote:
>> It's not clear what the process is for getting new board id's
>> supported in the board.bin files.
>
> The reaction of QCA when asking for new IDs was mostly "please go away, we
> will not talk to you about it". But with the help of Kalle Valo, a new
> mechanism called "qcom,ath10k-calibration-variant" was added (for embedded
> boards which include QCA 11ac wave2 radios). There are a couple of mails
> about it on this list - a general overview about BDFs, variant strings and
> why we need them can be found at
> http://lists.infradead.org/pipermail/ath10k/2018-March/011066.html.
>
> But it looks like you really got the IDs 30+31 (maybe because you are selling
> the, as separate PCIe modules?). Then I would guess that you can still use the
> same process as we use for the accesspoint specific BDFs (just without the
> variant= part).

These are Compex NICs, and they do have their own IDs.  These are general
purpose NICs that fit into most any system, so it would be good if the board
files were in the upstream board-2.bin file.

> The description of the general upstreaming process can be found at
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles - but it
> seems like Kalle Valo doesn't have much time for it at the moment for it (or
> there might be other problems which we don't see from our perspective - for
> example legal departments).
>
> Maybe you or Ben Greear can enhance the submission for the BDFs to better
> answer the questions from the "Submitting board files" guide.

Considering all of the not-accepted below, maybe we should just build
our own board file(s) for OpenWRT and let upstream catch up when someone
has time to deal with it?

For platform specific files, maybe better to just ignore the board-2.bin
entirely and use the specific board.bin file for that platform?

Thanks,
Ben

>
>
> Examples for such submission
> ============================
>
> * OpenMesh A42
>
>   - applied
>   - http://lists.infradead.org/pipermail/ath10k/2017-November/010470.html
>   - http://lists.infradead.org/pipermail/ath10k/2017-December/010543.html
>
> * Asus RT-AC58U
>
>   - not yet accepted
>   - submitted before the guide was published
>   - http://lists.infradead.org/pipermail/ath10k/2017-March/009454.html
>
> * Netgear EX6100v2/EX6150v2
>
>   - not yet accepted
>   - http://lists.infradead.org/pipermail/ath10k/2018-February/010845.html
>
> * 8devices Jalapeno
>
>   - not yet accepted
>   - http://lists.infradead.org/pipermail/ath10k/2018-March/010916.html
>
> * GL.iNet GL-B1300
>
>   - not yet accepted
>   - http://lists.infradead.org/pipermail/ath10k/2018-March/011058.html
>
> * OpenMesh A62
>
>   - not yet accepted
>   - http://lists.infradead.org/pipermail/ath10k/2018-March/011081.html
>
>
>
> Still waiting for send BDFs to upstream
> =======================================
>
> * Meraki MR33
>
>   - Chris Blake?
>   - https://github.com/openwrt/openwrt/blob/master/package/firmware/ipq-wifi/board-meraki_mr33.bin
>
> * Fritzbox 4040
>
>   - Christian Lamparter?
>   - https://github.com/openwrt/openwrt/blob/master/package/firmware/ipq-wifi/board-avm_fritzbox-4040.bin
>
> * maybe more which I missed
>
>
> Kind regards,
> 	Sven
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
