Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VpwmM-0007uN-36
 for ath10k@lists.infradead.org; Mon, 09 Dec 2013 09:05:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [BUG] QWLE900V5-18 - cannot achievie 3 spatial streams link
References: <52A1FC69.7080901@elnovel.com>
 <CALhHN=qPRgc-FaKbazdAmmxvi+YXxoFOp2Ax=x0iDp0LXknjHA@mail.gmail.com>
Date: Mon, 9 Dec 2013 11:04:56 +0200
In-Reply-To: <CALhHN=qPRgc-FaKbazdAmmxvi+YXxoFOp2Ax=x0iDp0LXknjHA@mail.gmail.com>
 (Janusz Dziedzic's message of "Fri, 6 Dec 2013 18:32:52 +0100")
Message-ID: <874n6i1jk7.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Tomasz Tajmajer <tt@elnovel.com>, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> On 6 December 2013 17:33, Tomasz Tajmajer <tt@elnovel.com> wrote:
>> Hi,
>>
>> Recently, I've been making quite a lot of tests with two QWLE900V5-18 cards.
>> I had some issues with the drivers (e.g. regarding the regulatory domain),
>> but I've managed to fix them on my own. However, there is one issue that I
>> cannot deal with.
>> I'm trying to get the highest throughput possible using 3x3 MIMO. The
>> problem is that the wifi card does not set higher rates than 2x433.3Mbps
>> (MCS 9, VHT-NSS 2). The specification says that it should be possible to
>> have 3 spatial streams.
>> First, I thought it is a problem with some options of hostapd, but hostapd
>> even does not allows me to set the [RX-STBC-12] or [RX-STBC-123] options.
>> Only [RX-STBC-1] may be set in the configuration (what in fact, does not
>> disallows the 2x433.3Mbps link, which is another issue).
>> Driver info shows that the driver should support 3 spatial streams.
>> I am not sure where is the problem, is it some bug in hostapd, which forces
>> the card to use 2 spatial streams only or is it the driver, which does not
>> enable 3 streams when it is possible. The physical connectivity (antennas
>> etc.) is not the problem AFAIK.
>>
>
> When sta assoc to ap you will get dbg mesg (you can enable this eg.
> when loading ath10k_core module with param - debug_mask).
> "mac ht peer %pM mcs cnt %d nss %d\n" - nss is interesting here

This debug message is enabled with ATH10K_DBG_MAC. More info here:

http://wireless.kernel.org/en/users/Drivers/ath10k/debug

> Also rx_mcs_set for STA from ath10k_peer_assoc_h_vht() could be
> interesting - unfortunetly we don't print this. But you can print
> this.

Indeed, we should include that to the message as well.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
