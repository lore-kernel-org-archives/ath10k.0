Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1bdT-0008Mb-T1
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 15:05:32 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldad-ath10k@m.gmane.org>) id 1a1bd2-0004W3-V9
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 16:05:05 +0100
Received: from gw01.albistechnologies.com ([212.243.134.2])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <ath10k@lists.infradead.org>; Wed, 25 Nov 2015 16:05:04 +0100
Received: from bartlomiej.grzeskowiak by gw01.albistechnologies.com with local
 (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
 for <ath10k@lists.infradead.org>; Wed, 25 Nov 2015 16:05:04 +0100
From: bartlomiej.grzeskowiak <bartlomiej.grzeskowiak@gmail.com>
Subject: adding QCA6174 chipset support to 3.10 kernel
Date: Wed, 25 Nov 2015 15:01:32 +0000 (UTC)
Message-ID: <loom.20151125T155720-404@post.gmane.org>
Mime-Version: 1.0
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

Our embedded device works with 3.10 kernel. Since it is not within our 
responsibility it is not easy to upgrade the whole kernel. We would like to 
use the WLAN card with QCA6174 chipset. 

I have found out, that QCA6174 chipset is first supported in 3.20 kernel. 
ath10k driver that services this chipset is first introduced in 3.11.

What would you recommend to achieve it ?

Thank you for answers


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
