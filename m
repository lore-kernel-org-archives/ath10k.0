Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YFGkk-00065x-Cm
 for ath10k@lists.infradead.org; Sun, 25 Jan 2015 06:32:59 +0000
Received: by mail-ie0-f182.google.com with SMTP id ar1so3925192iec.13
 for <ath10k@lists.infradead.org>; Sat, 24 Jan 2015 22:32:35 -0800 (PST)
Message-ID: <54C48E01.8020105@gmail.com>
Date: Sun, 25 Jan 2015 01:32:33 -0500
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
Subject: Question about FIXME in the function,ath10k_htc_send_complete_check
 for the file htc.c
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
To: kvalo@qca.qualcomm.com
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Greetings Again Kalle and others,
I am wondering about the fix me in the function,ath10k_htc_send_complete_check
for the file,htc.c. I am wondering if there is a hardware limitation and the
line for reserving 20 bytes for the sk_buff used is need in this function. I
am assuming this is needed due to hardware limitations and therefore can't be
removed but should be commented explaining this limitation. Please let me known
otherwise if I am missing something.
Thanks,
Nick 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
