Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsqgV-0006j8-9f
 for ath10k@lists.infradead.org; Fri, 06 Jun 2014 09:43:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
 <538CEAE0.6090304@candelatech.com>
Date: Fri, 6 Jun 2014 12:43:13 +0300
In-Reply-To: <538CEAE0.6090304@candelatech.com> (Ben Greear's message of "Mon, 
 2 Jun 2014 14:21:36 -0700")
Message-ID: <87tx7yl6fh.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> I'm looking at how iwlwifi/mvm does this.  I should be able to read the
> ath10k stack and exception stack on generic firmware, but to get the BSS region,
> I ended up adding some additional meta info to the firmware-2.bin image
> specifying the offsets when doing my CT firmware.
>
> You should not need to re-compile the firmware for this, but you would have
> to be able to run some xtensa tool commands to get this info and re-pack
> the firmware with additional meta-info (as far as I know).
>
> Any chance upstream firmware could support specifying the bss region
> offsets so that I can dump that into the debugfs dump file?

Sure, having the bss region in enum ath10k_fw_ie_type makes sense. And
if the value is missing from the image, we would have some sane default
in ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
