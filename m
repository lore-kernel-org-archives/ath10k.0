Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtWm6-0006g1-Tx
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 07:12:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: add new wmi interface of NF cal period
References: <1416945765-26902-1-git-send-email-poh@qca.qualcomm.com>
 <1416945765-26902-2-git-send-email-poh@qca.qualcomm.com>
Date: Wed, 26 Nov 2014 09:12:04 +0200
In-Reply-To: <1416945765-26902-2-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Tue, 25 Nov 2014 12:02:45 -0800")
Message-ID: <874mtmxwor.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> Introduce a new wmi interface controls noise floor (NF) calibration
> period via debugfs as firmware has introduced it on v10.2.
>
> It allows users to modify frequency of NF calibration in millisecond
> and changes RSSI reporting frequency consequently.
> Short calibration period will trigger more frequent NF calibration,
> so that RSSI reported in receive frames is more realistic.
>
> Till now calibration was done at 30 seconds.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

There was a trivial conflict in struct ath10k_debug, please double check
my conflict resolution:

https://github.com/kvalo/ath/commit/1abcc1aa6046231a55a296ea78ab2f374f6f791b

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
