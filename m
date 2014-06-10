Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuHyT-0008M6-Ou
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 09:04:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: fetching calibration data from flash
References: <5396B9F9.2070107@stackframe.org> <5396C39A.9080402@elisanet.fi>
 <87wqcpb0w1.fsf@kamboji.qca.qualcomm.com>
 <5396C8EC.4090105@elisanet.fi>
Date: Tue, 10 Jun 2014 12:03:40 +0300
In-Reply-To: <5396C8EC.4090105@elisanet.fi> (Matti Laakso's message of "Tue,
 10 Jun 2014 10:59:24 +0200")
Message-ID: <87sindb0gj.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Matti Laakso <malaakso@elisanet.fi>
Cc: ath10k@lists.infradead.org

Matti Laakso <malaakso@elisanet.fi> writes:

>> But why let the user name provide the file name? Why cannot it be a
>> fixed name, like "cal.bin"?

s/user name/user space/

> If there are multiple WNICs each with its own calibration data?

Ah, of course.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
