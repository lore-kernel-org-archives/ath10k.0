Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhfMv-00075U-Dk
 for ath10k@lists.infradead.org; Fri, 24 Oct 2014 13:57:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] Add the target register read/write and memory dump
 debugfs interface
References: <1413823085-3187-1-git-send-email-yanbol@qti.qualcomm.com>
Date: Fri, 24 Oct 2014 16:57:01 +0300
In-Reply-To: <1413823085-3187-1-git-send-email-yanbol@qti.qualcomm.com> (Yanbo
 Li's message of "Tue, 21 Oct 2014 00:38:05 +0800")
Message-ID: <87lho5muz6.fsf@kamboji.qca.qualcomm.com>
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
To: Yanbo Li <yanbol@qti.qualcomm.com>
Cc: senthilb@qti.qualcomm.com, dreamfly281@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yanbo Li <yanbol@qti.qualcomm.com> writes:

> The debugfs interface reg_addr&reg_val used to read and write the target
> register.
> The interface mem_addr&mem_val used to dump the targer memory and also
> can be used to assign value to target memory

I think you got the mail from kbuild bot already, but this patch has a
sparse warning:

>> drivers/net/wireless/ath/ath10k/debug.c:1182:26: sparse: incorrect type in assignment (different base types)
   drivers/net/wireless/ath/ath10k/debug.c:1182:26:    expected restricted __le32 [usertype] <noident>
   drivers/net/wireless/ath/ath10k/debug.c:1182:26:    got unsigned int [unsigned] [addressable] [usertype] mem_val

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
