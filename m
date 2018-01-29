Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from cvsmtppost032.nm.naver.com ([125.209.239.216])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eg8CP-0004ns-Ts
 for ath10k@lists.infradead.org; Mon, 29 Jan 2018 12:06:12 +0000
Received: from cvsendbo01.nm ([10.112.85.151])
 by cvsmtppost032.nm.naver.com with ESMTP id -ock6gsIS4yeI0+FvzjOkQ
 for <ath10k@lists.infradead.org>; Mon, 29 Jan 2018 12:05:53 -0000
MIME-Version: 1.0
Message-ID: <637bbe18904038b339d2565e6364eb70@cweb27.nm.nhnsystem.com>
Date: Mon, 29 Jan 2018 21:05:53 +0900
From: =?utf-8?B?7KCV7Iq57ZiE?=<hyun11man@naver.com>
In-Reply-To: <636e3ee2f7c034676d717c7b2f9aa4fc@cweb07.nm.nhnsystem.com>
References: <636e3ee2f7c034676d717c7b2f9aa4fc@cweb07.nm.nhnsystem.com>
Subject: =?utf-8?B?YXRoMTBrIGNoYW5uZWwgaW4gdHggcHJvY2Vzcw==?=
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: =?utf-8?B?7KCV7Iq57ZiE?= <hyun11man@naver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi all,
 
I am trying to figure out how ath10k (operating in AP mode) handles the channel on which an AP sends packets to one of its associated stations. I have found a few  functions including ath10k_sta_state set channel information for each station, but I couldn't find out which function(s) utilize the information while tx processing. Is there any function for channel selection while processing tx?
 
BTW, Does ath10k support broadcast and multicast? or always convert them into unicast? If it supports broadcast and multicast, does it always use 20MHz?
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
