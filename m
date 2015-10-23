Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zpi9C-0005Hp-Hb
 for ath10k@lists.infradead.org; Fri, 23 Oct 2015 19:37:07 +0000
Subject: Re: QCA 4x4 board.bin issues.
References: <562A867C.4030901@candelatech.com>
 <87fv111jem.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <562A8C4C.8000007@candelatech.com>
Date: Fri, 23 Oct 2015 12:36:44 -0700
MIME-Version: 1.0
In-Reply-To: <87fv111jem.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 10/23/2015 12:20 PM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> I'm trying to bring up a qca99x0 NIC from Compex, based on CUS239 from what
>> I can tell,  on today's ath.git and stock firmware from ath10k-firmware tree.
>>
>> I tried naming the boardData_AR900B_CUS239_5G_v2_001.bin to board-2.bin
>> but it evidently has bad magic.
>>
>> Should it actually be board-2.bin, or named something differently?
>
> It should be named as board.bin. I haven't uploaded board-2.bin for
> QCA99X0 yet, but should do that soon. With board-2.bin everything should
> happen just automatically.


Thanks, that seems to do the trick.

I've a wlan2 to play with now...will see how it actually works.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
