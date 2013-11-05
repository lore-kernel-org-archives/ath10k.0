Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vdljg-0002WF-Qu
 for ath10k@lists.infradead.org; Tue, 05 Nov 2013 18:52:21 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id rA5Ipuhx026045
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Tue, 5 Nov 2013 10:51:56 -0800
Message-ID: <52793E4B.20302@candelatech.com>
Date: Tue, 05 Nov 2013 10:51:55 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: What to do about hung firmware?
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

I'm seeing cases where it appears the firmware just gets
stuck and will not answer any WMI requests.

ath10k just patiently keeps timing out WMI commands,
(while holding locks, and making the whole system run slow).

Should we maybe keep a last-msg-from firmware time stamp
and just whack the firmware if we detect it hung?  In addition
to this, we could add some 'ping' message that will get sent
periodically to the firmware to make sure it is alive.
We should be able to do this with existing WMI API, just
need to pick a message to send that expects some response.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
