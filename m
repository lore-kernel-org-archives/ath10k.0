Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRjWM-0001WU-7N
 for ath10k@lists.infradead.org; Wed, 20 Dec 2017 18:55:16 +0000
Subject: lastest firmware 9984 (10.3-3.4.104)
References: <2025478478.2725588.1512857709726.ref@mail.yahoo.com>
 <2025478478.2725588.1512857709726@mail.yahoo.com> <4122842.1D0mIpT2Ae@uapou>
 <87bmj1moxc.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmokFG2JX=dfrrKz25WermY_EaWr2HLJiU7U+WMqEuT1YoA@mail.gmail.com>
 <007de27f-61cc-b27a-2049-e466d572b264@qti.qualcomm.com>
 <CAJ-VmokZHO6L1qN_jM0JiMNrsxudTbERZcwjAJb68xkyksa+EA@mail.gmail.com>
 <CAJ-Vmon=-ed9MCpR5XviA=9SJdQzAMnfqj3PibgUuBMwaOOofA@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <be8f7f28-05a7-7294-9108-d7ff359ecd3b@dd-wrt.com>
Date: Wed, 20 Dec 2017 19:37:55 +0100
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmon=-ed9MCpR5XviA=9SJdQzAMnfqj3PibgUuBMwaOOofA@mail.gmail.com>
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
To: ath10k@lists.infradead.org

with the most recent 10.3-3.4.104 firmware for 9984 i see this ath10k 
message
[ 2884.160502] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind 
event: in push mode
[ 2884.160545] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind 
event: in push mode
[ 2884.167760] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind 
event: in push mode
[ 2884.175905] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind 
event: in push mode

in addition there is a problem since a long time in wds ap mode. all wpa 
sta stations (no matter which chipset, ath9k and ath10k tests) gets 
kicked out at wpa rekeying. (and reconnect immediatly)
this problem exists on 99x0 and 9984 but not on 988x

any ideas?

Sebastian


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
