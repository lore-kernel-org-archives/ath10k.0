Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imDwi-00025o-CD
 for ath10k@lists.infradead.org; Tue, 31 Dec 2019 09:36:13 +0000
MIME-Version: 1.0
Date: Tue, 31 Dec 2019 17:36:10 +0800
From: wgong@codeaurora.org
Subject: Re: [PATCH] ath10k: select the min len of RX skb for sdio
In-Reply-To: <CAMrEMU94SDEP24XfFL-2R2KoK4NehwDY8p=MsNx1P7PBi111JQ@mail.gmail.com>
References: <20191220063829.11873-1-wgong@codeaurora.org>
 <CAMrEMU9cfYqgC_MvAuhJh5-pjqb_+WamHEkHf-t2ZW=nOR-8+w@mail.gmail.com>
 <c962d9a7401c4a3bbad71b01190fdce9@codeaurora.org>
 <CAMrEMU94SDEP24XfFL-2R2KoK4NehwDY8p=MsNx1P7PBi111JQ@mail.gmail.com>
Message-ID: <a57a6803397c5f5a97c64e7fc33de98c@codeaurora.org>
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
To: Justin Capella <justincapella@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

On 2019-12-20 20:11, Justin Capella wrote:
> If the data is invalid I think it should be discarded and a warning
> displayed, it is just as bad to pass too little data isn't it? Then
> you potentially have uninitialized data? Or pointers to nonsense?
> There is a good chance I am misunderstanding though, I just wanted to
> make sure you had considered those cases and the word alignment if
> that applies to this type of bus?
yes,
patch v2: https://patchwork.kernel.org/patch/11313849/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
