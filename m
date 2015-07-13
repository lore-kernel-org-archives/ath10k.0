Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEjS7-000545-8n
 for ath10k@lists.infradead.org; Mon, 13 Jul 2015 19:31:47 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 7EEBC40A39A
 for <ath10k@lists.infradead.org>; Mon, 13 Jul 2015 12:31:25 -0700 (PDT)
Message-ID: <55A4120D.6040407@candelatech.com>
Date: Mon, 13 Jul 2015 12:31:25 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: CT firmware available with management-over-HTT
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
To: ath10k <ath10k@lists.infradead.org>

For those interested, I have uploaded a beta build (version 15)
that enables management frames over the normal HTT transport.

Basic AP, Station, and IBSS testing has been completed
successfully.


This requires a driver patch...see the release notes for a link to
the patch:

# Release notes
http://www.candelatech.com/downloads/ath10k-fw-beta/release_notes.txt

# Firmware binary
http://www.candelatech.com/downloads/ath10k-fw-beta/firmware-2-ct-full-htt-mgt-community.bin

I'd be curious to know the results if anyone gives this a try.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
