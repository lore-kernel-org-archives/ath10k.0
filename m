Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fd7GE-0000gE-VY
 for ath10k@lists.infradead.org; Wed, 11 Jul 2018 05:01:56 +0000
MIME-Version: 1.0
Date: Wed, 11 Jul 2018 10:31:43 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v3 0/6] *** Add support for wifi QMI client handshakes ***
In-Reply-To: <20180711022425.GI2050@tuxbook-pro>
References: <20180706085622.27945-1-govinds@codeaurora.org>
 <20180711012638.GA100410@ban.mtv.corp.google.com>
 <20180711022425.GI2050@tuxbook-pro>
Message-ID: <0b1441507d2bb18ae267af65e13d98ec@codeaurora.org>
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: niklas.cassel@linaro.org, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, david.brown@linaro.org, andy.gross@linaro.org

On 2018-07-11 07:54, Bjorn Andersson wrote:
> On Tue 10 Jul 18:26 PDT 2018, Brian Norris wrote:
> 
>> Hi,
>> 
> 
> Hi Brian,
> 
>> On Fri, Jul 06, 2018 at 02:26:17PM +0530, Govind Singh wrote:
> [..]
>> > https://github.com/andersson/tqftpserv
>> 
>> FWIW, as of today, the tqftpserv implementation is missing a few 
>> headers
>> (so it doesn't even build),
> 
> Sorry about that, had those lingering in my repository. I've pushed a
> fix for this.
> 
>> and once I hack things such that it can
>> build, it still doesn't work for me (whereas the closed source version
>> does). I see some BYE and DEL_CLIENT messages, but no read requests.
> 
> I interpret this description as you're not seeing any prints at, beyond
> the "[TQFTP] got bye" and "[TQFTP] got del_client"?
> 
> That would imply that the remote side doesn't even attempt to
> communicate with tqftpserv.
> 
> Are you running pd-mapper (either proprietary or my version), is it
> complaining about anything?
> 
> Can you run qrtr-lookup on the device after booting the modem? So that
> we see that the tqftpserv is registered properly and that the modem is
> in an appropriate state?
> 
> Regards,
> Bjorn

For me below sequence is working. PD mapper is bypassed in the modem 
binary that Brian is using, hence that
may not be required at this moment.


qrtr-cfg 1
qrtr-ns


mkdir -p /dev/block/bootdevice/by-name/
ln -s /dev/sda4 /dev/block/bootdevice/by-name/modemst1
ln -s /dev/sda5 /dev/block/bootdevice/by-name/modemst2
ln -s /dev/sda6 /dev/block/bootdevice/by-name/fsc
ln -s /dev/sda7 /dev/block/bootdevice/by-name/fsg

ln -s /var/log/ /readwrite
ln -s /lib/firmware/wlanmdsp.mbn /readonly/firmware/image/wlanmdsp.mbn

rmt_storage &
tqftpserv &


Thanks,
Govind

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
