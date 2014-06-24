Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzV5t-00078Y-QR
 for ath10k@lists.infradead.org; Tue, 24 Jun 2014 18:05:22 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 686A240A79A
 for <ath10k@lists.infradead.org>; Tue, 24 Jun 2014 11:04:58 -0700 (PDT)
Message-ID: <53A9BDCA.8080000@candelatech.com>
Date: Tue, 24 Jun 2014 11:04:58 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Latest ath10k performance stats
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

Using CT firmware, E5 3.7Ghz hex-core station system, slightly slower AP system,
kernel is hacked 3.14.7+.
AP is NOT configured for software-crypt, but station machine is.
Systems are connected with 3 meter high quality COAX SMA cables + 30dB fixed attenuator,
but this is not a fully isolated environment.  Running on channel 149, HT80.
UDP connections are configured with 2MB send + receive socket buffers, 1500 MTU sized packets.
AP is acting as router (and running ath10k, etc).

TCP is configured for 10 streams, default OS send/receive buffer management.

Station machine sends to/from eth1 and station, ie it is both ends
of the connection.  UDP transmit is tuned to be just above what system
can handle.  If you send at full 1Gbps, total received throughput is
around 20% slower.

The rates reported are 'goodput' for the protocol in question.

WPA2 (station RX uses software encryption, so CPU bound)
  UDP Download: 530 Mbps
  UDP Upload:   610 Mbps
  TCP Download: 459 Mbps
  TCP Upload:   570 Mbps


Open Authentication
  UDP Download: 830 Mbps  **
  UDP Upload:   615 Mbps
  TCP Download: 660 Mbps (400+ ms latency, one way, by the way)
  TCP Upload:   570 Mbps


** We currently ignore checksum errors, part of what it takes to make
   rx-software-crypt work.  But, on high-speed UDP download (Open Auth) we see a fair
   bit of what must be legit checksum errors, and our traffic generator sees
   corrupted data streams and restarts itself.  So throughput is not even.

   Will work on fixing this in our kernel, should be able to pay attention to
   csum errors IF packet is not encrypted.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
