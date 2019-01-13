Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from n7smtp2.enseeiht.fr ([147.127.176.23])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gihFr-000098-OY
 for ath10k@lists.infradead.org; Sun, 13 Jan 2019 15:00:53 +0000
Received: from imap.enseeiht.fr (imap.enseeiht.fr [147.127.176.21])
 by n7smtp2.enseeiht.fr (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
 x0DF0mHu024049
 for <ath10k@lists.infradead.org>; Sun, 13 Jan 2019 16:00:50 +0100
Received: from [192.168.0.17] (182.130.83.79.rev.sfr.net [79.83.130.182])
 (authenticated bits=0)
 by imap.enseeiht.fr (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
 x0DF0jqN029494
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
 for <ath10k@lists.infradead.org>; Sun, 13 Jan 2019 16:00:47 +0100
From: Kevin Jiokeng <kevin.jiokeng@enseeiht.fr>
Subject: ath10k CSI extraction
Message-ID: <472d6fc4-5960-de33-ee0a-77b0148c816e@enseeiht.fr>
Date: Sun, 13 Jan 2019 16:00:40 +0100
MIME-Version: 1.0
Content-Language: fr
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

Hello,

I'm trying to extract CSI (Channel State Information) on some 
ath10k-based devices (QCA9984 and IPQ4018).
I saw some threads about this subject in this mailing list, but they did 
not get any practical answer.

Can anyone point me to a patch/tool to obtain that info ?

Thanks in advance.
Kevin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
