Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp103.iad3a.emailsrvr.com ([173.203.187.103])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bylM5-00072E-B7
 for ath10k@lists.infradead.org; Mon, 24 Oct 2016 19:56:21 +0000
Received: from smtp21.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
 by smtp21.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 08951401EE
 for <ath10k@lists.infradead.org>; Mon, 24 Oct 2016 15:56:00 -0400 (EDT)
Received: from app19.wa-webapps.iad3a (relay-webapps.rsapps.net
 [172.27.255.140])
 by smtp21.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id F29A640231
 for <ath10k@lists.infradead.org>; Mon, 24 Oct 2016 15:55:59 -0400 (EDT)
Received: from abineau.com (localhost [127.0.0.1])
 by app19.wa-webapps.iad3a (Postfix) with ESMTP id E5042C1C82
 for <ath10k@lists.infradead.org>; Mon, 24 Oct 2016 15:55:59 -0400 (EDT)
Date: Mon, 24 Oct 2016 15:55:59 -0400 (EDT)
Subject: Direct firmware load failed with error 2
From: cmckay@abineau.com
MIME-Version: 1.0
Message-ID: <1477338959.93584918@apps.rackspace.com>
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
To: ath10k@lists.infradead.org

Hi,
 
I'm attempting to add a Silex PCEAC or Compex WLE900VX (both QCA9880) mini PCIe card to a Toradex Apalis iMX6 SOM on their Ixora card. I added a BSP layer to Toradex's standard build, simply adding the ath10k and noting more.
I keep running into the following error:
 
[ 7.063663] ath10k_pci 0000:01:00.0: BAR 0: assigned [mem 0x01000000-0x011ff]
[ 7.172118] ath10k: pci irq MSI 
[ 7.198024] ath10k_pci 0000:01:00.0: Direct firmware load failed with error 2
[ 7.209646] ath10k_pci 0000:01:00.0: Falling back to user helper 
[ 8.626488] ath10k: could not fetch board data (-2) 
[ 8.648471] ath10k_pci 0000:01:00.0: Direct firmware load failed with error 2
[ 8.693701] ath10k_pci 0000:01:00.0: Falling back to user helper 
[ 8.712302] ath10k: could not fetch board data (-2) 
[ 8.722757] ath10k: could not fetch firmware files (-2) 
[ 8.781868] ath10k: could not probe fw (-2) 
[ 8.781874] ath10k: failed to register driver core: -2 
[ 8.782041] ath10k_pci: probe of 0000:01:00.0 failed with error -2
 
I've tried the firmware-2, firmware-5 and Candella firmware. I can't find any information on what this error means or how to debug this issue. And the vendors are struggling to get me a solution. 
Any help would be greatly appreciated.  
 
Colin McKay
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
