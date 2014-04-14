Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZmgO-0002zO-Bz
 for ath10k@lists.infradead.org; Mon, 14 Apr 2014 19:36:44 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s3EJaHMn022827
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Mon, 14 Apr 2014 12:36:18 -0700
Message-ID: <534C38AE.3070504@candelatech.com>
Date: Mon, 14 Apr 2014 12:36:14 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Modified ath10k firmware is now available for non-commercial use.
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

Our modified ath10k firmware binary is now available for download.  It may only be used
for non-commercial purposes unless you get a commercial license from my company.

The main thing this firmware supports that upstream firmware does not
is lots of virtual stations connected to the same AP.  We have some
additional stability fixes we found in testing, and probably have introduced
some bugs as well.  We will be putting ongoing effort into improving
this firmware.

We also have the ability to decode firmware stack dumps (found in
dmesg and/or /var/log/messages) if they come from our firmware.
We cannot share the details of the decode nor tools to decode it,
but we will try to fix the problems and/or describe the results of
our decode in general terms.

The firmware should work with stock 3.14 or other recent kernels,
but we have done most testing using our own modified 3.14 kernel.
Our kernel patches are required to support the additional stations,
software-crypt, and other features specific to our firmware.

If you use our firmware and manage to crash it, please send to me the pertinent
part of /var/log/messages (or dmesg), including any ath10k related ascii
hex dumps.  Other non-crash bug reports are welcome too.

Please do not bother the QCA developers with any bugs specific to our
firmware (or our kernel patches).

Links to the firmware binary, our 3.14.0+ kernel source, and related
info is found here:

http://www.candelatech.com/vsta.php

Please let me know if you have any questions.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
