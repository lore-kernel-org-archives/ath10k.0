Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrZg8-00006V-FS
 for ath10k@lists.infradead.org; Mon, 02 Jun 2014 21:22:01 +0000
Message-ID: <538CEAE0.6090304@candelatech.com>
Date: Mon, 02 Jun 2014 14:21:36 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 06/02/2014 09:21 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> I have a bunch of patches that can dump some firmware debug logs,
>> stack, and exception stacks as ascii hex. Ath10k firmware-having folks
>> can use private tools to extract and decode useful info from this.
> 
> You mean via printk? That sounds ugly.
> 
> There was talk on linux-wireless about how to handle firmware crash
> dumps in a generic way. One proposal was to use ethtool and an event for
> this. Before that I was thinking of using trace points. Maybe we should
> support both?
> 
> We should come up with an extensible format how to provide the firmware
> crash logs to user space, for example using some TLV based format, which
> contain all the necessary information (hw details, firmware version,
> memory dumps and whatnot). But ath10k should not have any parsing of the
> dumps, that should happen in user space.

I'm looking at how iwlwifi/mvm does this.  I should be able to read the
ath10k stack and exception stack on generic firmware, but to get the BSS region,
I ended up adding some additional meta info to the firmware-2.bin image
specifying the offsets when doing my CT firmware.

You should not need to re-compile the firmware for this, but you would have
to be able to run some xtensa tool commands to get this info and re-pack
the firmware with additional meta-info (as far as I know).

Any chance upstream firmware could support specifying the bss region
offsets so that I can dump that into the debugfs dump file?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
