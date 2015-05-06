Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpwjT-0005EA-Nx
 for ath10k@lists.infradead.org; Wed, 06 May 2015 10:39:16 +0000
Message-ID: <5549EF46.10104@dd-wrt.com>
Date: Wed, 06 May 2015 12:39:02 +0200
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
MIME-Version: 1.0
References: <55494598.2060603@candelatech.com>
In-Reply-To: <55494598.2060603@candelatech.com>
Subject: changing hw address of ath10k card
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

Hello

I recently stumbled across a problem in ath10k. while developing on 
embedded wireless routers
i found a device which uses a ar988x card using a card embedded board 
eeprom. the problem is there is no way to override
the cards hardware/mac address, which is required on that device since 
it uses just a fake mac on that board data.
is there any way/trick available to deal with that problem?

Sebastian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
