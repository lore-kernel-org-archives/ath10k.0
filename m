Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from omr-m2.mx.aol.com ([64.12.133.13])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKRfj-0005YP-K3
 for ath10k@lists.infradead.org; Sun, 08 Feb 2015 13:13:12 +0000
Received: from mtaout-maa01.mx.aol.com (mtaout-maa01.mx.aol.com
 [172.26.222.141])
 by omr-m2.mx.aol.com (Outbound Mail Relay) with ESMTP id BC02D38000082
 for <ath10k@lists.infradead.org>; Sun,  8 Feb 2015 08:12:17 -0500 (EST)
Received: from [192.168.1.67] (c-76-126-185-64.hsd1.ca.comcast.net
 [76.126.185.64])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mtaout-maa01.mx.aol.com (MUA/Third Party Client Interface) with ESMTPSA id
 19B0A38000094
 for <ath10k@lists.infradead.org>; Sun,  8 Feb 2015 08:12:17 -0500 (EST)
Message-ID: <54D760AF.4090805@aol.com>
Date: Sun, 08 Feb 2015 05:12:15 -0800
From: Austin Hendrix <legotown@aol.com>
MIME-Version: 1.0
Subject: First QCA6174 firmware release
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

I have the same issue as Joris; my QCA6174 appears to be a hw2.1 
version. lspci -vvv returns similar results.

The wireless card is a " Killer N1525 Combo (2x2 ac)", in an MSI GS60 
Ghost Pro 4K laptop; purchased in January of 2015.

Similar to Joris, I've also found what appears to be firmware as part of 
the existing Windows installation, but it looks like it's missing the 
header information and magic bits that will allow it to load.

Does anyone have any pointers on how I might go about confirming that 
this is the correct firmware; preparing it for the ath10k driver with 
the appropriate header, and preparing the matching board.bin file?

Thanks,
-Austin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
