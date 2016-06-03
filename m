Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8s2Z-0000YP-JI
 for ath10k@lists.infradead.org; Fri, 03 Jun 2016 16:33:44 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: remove 10.1 firmware support
Date: Fri, 3 Jun 2016 16:33:16 +0000
Message-ID: <87oa7iut9x.fsf@kamboji.qca.qualcomm.com>
References: <20160603153328.11947-1-rmanohar@qti.qualcomm.com>
 <20160603153328.11947-2-rmanohar@qti.qualcomm.com>
 <5751A6D5.7080901@candelatech.com>
 <743182bcbd1efbdb576bcc51b0215300@codeaurora.org>
 <87shwuuuct.fsf@kamboji.qca.qualcomm.com>	<5751AE44.8050607@candelatech.com>
In-Reply-To: <5751AE44.8050607@candelatech.com> (Ben Greear's message of "Fri, 
 3 Jun 2016 09:20:20 -0700")
Content-Language: en-US
Content-ID: <EDE7ABC52993684F8429DE4A94897E59@qualcomm.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>

Ben Greear <greearb@candelatech.com> writes:

>>> Is it possible to upgrade CT firmware to 10.2 WMI/HTT interfaces?
>>
>> That's a good idea. That shouldn't be too hard, right? I don't think HTT needs
>> any changes, but for WMI few commands and ids need to be changed.
>
> I was thinking the 10.2 mgt-over-htt API would be trouble-some to make work on
> 10.1 firmware.

Yeah, that would be harder. But I don't see Rajkumar removing support
for that (yet) or am I missing something?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
