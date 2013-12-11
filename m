Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqlOO-0007HJ-22
 for ath10k@lists.infradead.org; Wed, 11 Dec 2013 15:08:04 +0000
Message-ID: <52A87FBD.4000901@candelatech.com>
Date: Wed, 11 Dec 2013 07:07:41 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Question on software-crypt mode.
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
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello!

I am trying to implement software-crypt for ath10k so that it can do crypt
with multiple stations connected to same AP.

I tried using ath9k's approach and just not setting keys, but that does not work at all
(no stations can communicate).

If I basically leave code as is, then secondary stations can associate but never
get DHCP.  I see FCS and hw-crypt errored packets being received from the
ath10k firmware/chip.  This is probably because the chip/firmware decodes the
secondary station's packets with the first station's keys.
Transmitted packets (as sniffed from the AP) do appear fine.

I was thinking to just take all fcs and/or crypt-errored packets in
the receive path and somehow send them up the stack for the software-crypt
layer to (re)decrypt.  I think I have managed to get ath10k to send them
up, but still DHCP does not complete.

Does anyone have any suggestions for things to try or code to look at in
detail?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
